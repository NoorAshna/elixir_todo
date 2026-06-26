defmodule Todo.Todos.My_Todo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :title, :string
    field :description, :string
    field :completed, :boolean, default: false

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(my__todo, attrs) do
    my__todo
    |> cast(attrs, [:title, :completed, :description])
    |> validate_required([:title, :completed])
  end
end
