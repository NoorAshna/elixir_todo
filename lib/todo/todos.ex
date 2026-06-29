defmodule Todo.Todos do
  @moduledoc """
  The Todos context.
  """

  import Ecto.Query, warn: false
  alias Todo.Repo

  alias Todo.Todos.My_Todo

  def list_todos do
    Repo.all(My_Todo)
  end

  def get_my__todo!(id), do: Repo.get!(My_Todo, id)

  @doc """
  Creates a my__todo.

  """
  def create_my__todo(attrs) do
    %My_Todo{}
    |> My_Todo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a my__todo.
  """
  def update_my__todo(%My_Todo{} = my__todo, attrs) do
    my__todo
    |> My_Todo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a my__todo.

  """
  def delete_my__todo(%My_Todo{} = my__todo) do
    Repo.delete(my__todo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking my__todo changes.

  """
  def change_my__todo(%My_Todo{} = my__todo, attrs \\ %{}) do
    My_Todo.changeset(my__todo, attrs)
  end
end
