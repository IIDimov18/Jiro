const dbConfig = require('../config/dbConfig');
const sql = require('mssql/msnodesqlv8');

/**
 * Class that is for connecting to the database and fro executing procedures and queries
 * @author Ivan Dimov <IIDimov18@codingburgas.bg>
 */
class db {
    /**
     * Connect to the database if it's not already connected
     */
    constructor() {
        if (!this._connection) {
            this.constructor.connectToDB();
        }
    }
    /**
     * @method connectToDB
     * Try to make connection to the database
     *
     */
    static async connectToDB() {
        try {
            await sql.connect(this._config);
            this._connection = true;
            console.log('qsha');
        } catch (err) {
            console.log(err);
        }
    }

    /**
     * @method registerUser execute the stored procedure with the given parameters
     * @param {string} firstName first name of the user
     * @param {string} lastName last name of the user
     * @param {string} username username of the user
     * @param {string} password hashed password of the user
     * @param {string} salt salt for the password of the new user
     * @param {string} token the token of the admin that created the user
     * @param {string} isAdmin this indicate if the user is going to be admin
     *
     *  */

    async registerUser(firstName, lastName, username, password, salt,isAdmin,token) {
        const request = new sql.Request();

        request.input('FirstName', sql.NVarChar, firstName)
            .input('LastName', sql.NVarChar, lastName)
            .input('username', sql.NVarChar, username)
            .input('HashPassword', sql.VarChar, password)
            .input('salt', sql.VarChar, salt)
            .input('isAdmin',sql.Bit,isAdmin)
            .input('Token',sql.VarChar,token);

        let result;

        try {
            result = await request.query(
                `EXEC RegisterUser
            @Username = @username,
            @FirstName = @FirstName,
            @LastName = @LastName,
            @Password = @HashPassword,
            @Salt = @salt,
            @IsAdmin = @isAdmin,
            @CreatorToken = @Token`
            );
        } catch (err) {
            return new Array(err);
        }

        return result.recordset;
    }

    async getSalt(username) {
        const request = new sql.Request();

        request.input('username', sql.NVarChar, username);

        let result;

        try {
            result = await request.query(
                `SELECT Salt FROM Users WHERE Username = @username`
            );
        } catch (err) {
            return new Array(err);
        }

        return result.recordset;
    }

    async loginUser(username,password) {
        const request = new sql.Request();

        request.input('username', sql.NVarChar, username)
            .input('HashPassword', sql.VarChar, password);

        let result;

        try {
            result = await request.query(
                `SELECT Token, isAdmin FROM Users WHERE Username = @username`
            );
        } catch (err) {
            return new Array(err);
        }

        return result.recordset;
    }

    async registerTeam(name,token) {
        const request = new sql.Request();

        request.input('name', sql.NVarChar, name)
        .input('token',sql.VarChar, token);

        let result;

        try {
            result = await request.query(
                `INSERT INTO Teams (Title, IdOfCreator) VALUES (@name, (SELECT Id FROM Users WHERE Token = @token))`
            );
        } catch (err) {
            return new Array(err);
        }

        return result.recordset;
    }


    async deleteUser(id){
        const request = new sql.Request();

        request.input('Id', sql.Int,id);

        let result;

        try {
            result = await request.query(
                `DELETE FROM Users WHERE Id = @Id`
            );
        } catch (err) {
            return new Array(err);
        }

        return result.recordset;
    }

    async editUser(id,username,firstName,lastName,isAdmin,token){
        const request = new sql.Request();

        request.input('FirstName', sql.NVarChar, firstName)
            .input('LastName', sql.NVarChar, lastName)
            .input('username', sql.NVarChar, username)
            .input('isAdmin',sql.Bit,isAdmin)
            .input('ChangerToken',sql.VarChar,token)
            .input('Id', sql.Int,id);

        let result;

        try {
            result = await request.query(
                `UPDATE Users SET Firstname = @FirstName, Lastname = @LastName, Username = @Username, isAdmin = @IsAdmin, IdOfLastChanger = (SELECT Id FROM Users WHERE Token = @ChangerToken) WHERE Id = @Id`
            );
        } catch (err) {
            return new Array(err);
        }

        return result.recordset;
    }

    async getUsers(){
        const request = new sql.Request();

        let result;

        try {
            result = await request.query(
                `SELECT Id, Username, FirstName, LastName, IdOfCreator, isAdmin FROM Users`
            );
        } catch (err) {
            return new Array(err);
        }

        return result.recordset;
    }

    //private
    static _config = dbConfig.config;
    static _connection = false;
}

module.exports = db;
