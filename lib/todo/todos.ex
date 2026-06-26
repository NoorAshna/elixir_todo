defmodule Todo.Todos do
  @moduledoc """
  The Todos context.
  """

  import Ecto.Query, warn: false
  alias Todo.Repo

  alias Todo.Todos.My_Todo

  @doc """
  Returns the list of todos.

  ## Examples

      iex> list_todos()
      [%My_Todo{}, ...]

  """
  def list_todos do
    Repo.all(My_Todo)
  end

  @doc """
  Gets a single my__todo.

  Raises `Ecto.NoResultsError` if the My  todo does not exist.

  ## Examples

      iex> get_my__todo!(123)
      %My_Todo{}

      iex> get_my__todo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_my__todo!(id), do: Repo.get!(My_Todo, id)

  @doc """
  Creates a my__todo.

  ## Examples

      iex> create_my__todo(%{field: value})
      {:ok, %My_Todo{}}

      iex> create_my__todo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_my__todo(attrs) do
    %My_Todo{}
    |> My_Todo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a my__todo.

  ## Examples

      iex> update_my__todo(my__todo, %{field: new_value})
      {:ok, %My_Todo{}}

      iex> update_my__todo(my__todo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_my__todo(%My_Todo{} = my__todo, attrs) do
    my__todo
    |> My_Todo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a my__todo.

  ## Examples

      iex> delete_my__todo(my__todo)
      {:ok, %My_Todo{}}

      iex> delete_my__todo(my__todo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_my__todo(%My_Todo{} = my__todo) do
    Repo.delete(my__todo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking my__todo changes.

  ## Examples

      iex> change_my__todo(my__todo)
      %Ecto.Changeset{data: %My_Todo{}}

  """
  def change_my__todo(%My_Todo{} = my__todo, attrs \\ %{}) do
    My_Todo.changeset(my__todo, attrs)
  end
end
