let editModal = document.getElementById('EditModal')
editModal.addEventListener('show.bs.modal', function (event) {

    let button = event.relatedTarget

    let id = button.getAttribute('data-bs-id');
    let username = button.getAttribute('data-bs-username');
    let firstName = button.getAttribute('data-bs-firstName');
    let lastName = button.getAttribute('data-bs-lastName');
    let isAdmin = button.getAttribute('data-bs-isAdmin');

    editModal.querySelector('.modal-body #username').value = username;
    editModal.querySelector('.modal-body #id').value = id;
    editModal.querySelector('.modal-body #firstName').value = firstName;
    editModal.querySelector('.modal-body #lastName').value = lastName;
    document.getElementById('isAdmin').checked = isAdmin ==='true';
})
