const form = document.querySelector('form');

form.addEventListener('submit', (event) => {
  event.preventDefault();

  const formData = new FormData(form);
  const book = {
    title: formData.get('title'),
    author: formData.get('author'),
    description: formData.get('description'),
    cover: formData.get('cover'),
    rating: formData.get('rating')
  };

  const bookList = document.querySelector('.books');
  const bookItem = document.createElement('li');

  bookItem.innerHTML = `
    <img src="${book.cover}" alt="Book Cover">
    <h3>${book.title}</h3>
    <p>${book.author}</p>
    <p>${book.description}</p>
    <p>Rating: ${book.rating}</p>
  `;

  bookList.appendChild(bookItem);
});
