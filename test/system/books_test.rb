require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
  end

  test "visiting the index" do
    visit books_url
    assert_selector "h1", text: "Books"
  end

  test "should create books" do
    visit books_url
    click_on "New books"

    fill_in "Author", with: @book.author
    fill_in "Book count", with: @book.book_count
    fill_in "Description", with: @book.description
    fill_in "Title", with: @book.title
    click_on "Create Books"

    assert_text "Books was successfully created"
    click_on "Back"
  end

  test "should update Books" do
    visit book_url(@book)
    click_on "Edit this books", match: :first

    fill_in "Author", with: @book.author
    fill_in "Book count", with: @book.book_count
    fill_in "Description", with: @book.description
    fill_in "Title", with: @book.title
    click_on "Update Books"

    assert_text "Books was successfully updated"
    click_on "Back"
  end

  test "should destroy Books" do
    visit book_url(@book)
    click_on "Destroy this books", match: :first

    assert_text "Books was successfully destroyed"
  end
end
