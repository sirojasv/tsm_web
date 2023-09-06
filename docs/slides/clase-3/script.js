var h2Elements = document.querySelectorAll('h2');
for (var i = 0; i < h2Elements.length; i++) {
    if (h2Elements[i].textContent.trim() !== '') {
        h2Elements[i].classList.add('non-empty');
    }
}