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

  def polite_present(%Verb{} = verb) do
    verb.midashi
    |> String.replace_suffix("る", "ます")
  end

  # ichidan or verb group 2.
  def polite_past(%Verb{kumi: "ichidan"} = verb) do
    verb.midashi
    |> String.replace_suffix("る", "ました")
  end

  def polite_past(%Verb{kumi: "godan"} = verb) do
    verb.midashi
    # |> String.shift(sa->si)
    |> String.replace_suffix("", "ました")
  end

  def polite_past(%Verb{kumi: "irregular"} = verb) do
    verb.midashi
    # |> String.replace_suffix("")
  end
end
