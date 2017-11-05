defmodule JapHaji.API.Verb do
  use Ecto.Schema
  import Ecto.Changeset
  alias JapHaji.API.Verb


  schema "verbs" do
    field :kumi, :string
    field :midashi, :string
    field :yomi, :string

    timestamps()
  end

  @doc false
  def changeset(%Verb{} = verb, attrs) do
    verb
    |> cast(attrs, [:midashi, :yomi, :kumi])
    |> validate_required([:midashi, :yomi, :kumi])
  end
end
