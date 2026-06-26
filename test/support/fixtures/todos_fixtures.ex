defmodule Todo.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todo.Todos` context.
  """

  @doc """
  Generate a my__todo.
  """
  def my__todo_fixture(attrs \\ %{}) do
    {:ok, my__todo} =
      attrs
      |> Enum.into(%{
        completed: true,
        title: "some title"
      })
      |> Todo.Todos.create_my__todo()

    my__todo
  end
end
