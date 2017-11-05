defmodule JapHaji.Repo.Migrations.CreateVerbs do
  use Ecto.Migration

  def change do
    create table(:verbs) do
      add :midashi, :string
      add :yomi, :string
      add :kumi, :string

      timestamps()
    end

  end
end
