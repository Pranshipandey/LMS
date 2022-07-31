require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get books_index_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference("Books.count") do
      post books_index_url, params: { book: { author: @book.author, book_count: @book.book_count, description: @book.description, title: @book.title } }
    end

    assert_redirected_to book_url(Books.last)
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { author: @book.author, book_count: @book.book_count, description: @book.description, title: @book.title } }
    assert_redirected_to book_url(@book)
  end

  test "should destroy book" do
    assert_difference("Books.count", -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_index_url
  end
end
