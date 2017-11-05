defmodule JapHaji.APITest do
  use JapHaji.DataCase

  alias JapHaji.API

  describe "verbs" do
    alias JapHaji.API.Verb

    @valid_attrs %{kumi: "some kumi", midashi: "some midashi", yomi: "some yomi"}
    @update_attrs %{kumi: "some updated kumi", midashi: "some updated midashi", yomi: "some updated yomi"}
    @invalid_attrs %{kumi: nil, midashi: nil, yomi: nil}

    def verb_fixture(attrs \\ %{}) do
      {:ok, verb} =
        attrs
        |> Enum.into(@valid_attrs)
        |> API.create_verb()

      verb
    end

    test "list_verbs/0 returns all verbs" do
      verb = verb_fixture()
      assert API.list_verbs() == [verb]
    end

    test "get_verb!/1 returns the verb with given id" do
      verb = verb_fixture()
      assert API.get_verb!(verb.id) == verb
    end

    test "create_verb/1 with valid data creates a verb" do
      assert {:ok, %Verb{} = verb} = API.create_verb(@valid_attrs)
      assert verb.kumi == "some kumi"
      assert verb.midashi == "some midashi"
      assert verb.yomi == "some yomi"
    end

    test "create_verb/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = API.create_verb(@invalid_attrs)
    end

    test "update_verb/2 with valid data updates the verb" do
      verb = verb_fixture()
      assert {:ok, verb} = API.update_verb(verb, @update_attrs)
      assert %Verb{} = verb
      assert verb.kumi == "some updated kumi"
      assert verb.midashi == "some updated midashi"
      assert verb.yomi == "some updated yomi"
    end

    test "update_verb/2 with invalid data returns error changeset" do
      verb = verb_fixture()
      assert {:error, %Ecto.Changeset{}} = API.update_verb(verb, @invalid_attrs)
      assert verb == API.get_verb!(verb.id)
    end

    test "delete_verb/1 deletes the verb" do
      verb = verb_fixture()
      assert {:ok, %Verb{}} = API.delete_verb(verb)
      assert_raise Ecto.NoResultsError, fn -> API.get_verb!(verb.id) end
    end

    test "change_verb/1 returns a verb changeset" do
      verb = verb_fixture()
      assert %Ecto.Changeset{} = API.change_verb(verb)
    end
  end
end
