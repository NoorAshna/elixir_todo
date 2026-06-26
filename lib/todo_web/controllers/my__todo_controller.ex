defmodule TodoWeb.My_TodoController do
  use TodoWeb, :controller

  alias Todo.Todos
  alias Todo.Todos.My_Todo

  def index(conn, _params) do
    todos = Todos.list_todos()
    render(conn, :index, todos: todos)
  end

  def new(conn, _params) do
    changeset = Todos.change_my__todo(%My_Todo{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"my__todo" => my__todo_params}) do
    case Todos.create_my__todo(my__todo_params) do
      {:ok, my__todo} ->
        conn
        |> put_flash(:info, "My  todo created successfully.")
        |> redirect(to: ~p"/todos/#{my__todo}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    my__todo = Todos.get_my__todo!(id)
    render(conn, :show, my__todo: my__todo)
  end

  def edit(conn, %{"id" => id}) do
    my__todo = Todos.get_my__todo!(id)
    changeset = Todos.change_my__todo(my__todo)
    render(conn, :edit, my__todo: my__todo, changeset: changeset)
  end

  def update(conn, %{"id" => id, "my__todo" => my__todo_params}) do
    my__todo = Todos.get_my__todo!(id)

    case Todos.update_my__todo(my__todo, my__todo_params) do
      {:ok, my__todo} ->
        conn
        |> put_flash(:info, "My  todo updated successfully.")
        |> redirect(to: ~p"/todos/#{my__todo}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, my__todo: my__todo, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    my__todo = Todos.get_my__todo!(id)
    {:ok, _my__todo} = Todos.delete_my__todo(my__todo)

    conn
    |> put_flash(:info, "My  todo deleted successfully.")
    |> redirect(to: ~p"/todos")
  end
end
