defmodule Todo.TodosTest do
  use Todo.DataCase

  alias Todo.Todos

  describe "todos" do
    alias Todo.Todos.My_Todo

    import Todo.TodosFixtures

    @invalid_attrs %{title: nil, completed: nil}

    test "list_todos/0 returns all todos" do
      my__todo = my__todo_fixture()
      assert Todos.list_todos() == [my__todo]
    end

    test "get_my__todo!/1 returns the my__todo with given id" do
      my__todo = my__todo_fixture()
      assert Todos.get_my__todo!(my__todo.id) == my__todo
    end

    test "create_my__todo/1 with valid data creates a my__todo" do
      valid_attrs = %{title: "some title", completed: true}

      assert {:ok, %My_Todo{} = my__todo} = Todos.create_my__todo(valid_attrs)
      assert my__todo.title == "some title"
      assert my__todo.completed == true
    end

    test "create_my__todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todos.create_my__todo(@invalid_attrs)
    end

    test "update_my__todo/2 with valid data updates the my__todo" do
      my__todo = my__todo_fixture()
      update_attrs = %{title: "some updated title", completed: false}

      assert {:ok, %My_Todo{} = my__todo} = Todos.update_my__todo(my__todo, update_attrs)
      assert my__todo.title == "some updated title"
      assert my__todo.completed == false
    end

    test "update_my__todo/2 with invalid data returns error changeset" do
      my__todo = my__todo_fixture()
      assert {:error, %Ecto.Changeset{}} = Todos.update_my__todo(my__todo, @invalid_attrs)
      assert my__todo == Todos.get_my__todo!(my__todo.id)
    end

    test "delete_my__todo/1 deletes the my__todo" do
      my__todo = my__todo_fixture()
      assert {:ok, %My_Todo{}} = Todos.delete_my__todo(my__todo)
      assert_raise Ecto.NoResultsError, fn -> Todos.get_my__todo!(my__todo.id) end
    end

    test "change_my__todo/1 returns a my__todo changeset" do
      my__todo = my__todo_fixture()
      assert %Ecto.Changeset{} = Todos.change_my__todo(my__todo)
    end
  end
end
