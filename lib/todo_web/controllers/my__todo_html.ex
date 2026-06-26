defmodule TodoWeb.My_TodoHTML do
  use TodoWeb, :html

  embed_templates "my__todo_html/*"

  @doc """
  Renders a my__todo form.

  The form is defined in the template at
  my__todo_html/my__todo_form.html.heex
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true
  attr :return_to, :string, default: nil

  def my__todo_form(assigns)
end
