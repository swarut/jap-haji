defmodule JapHaji.VerbTest do
  use JapHaji.DataCase

  alias JapHaji.API

  describe "verbs" do
    alias JapHaji.API.Verb

    @ichidan_verb_attrs %{kumi: "ichidan",   midashi: "食べる", yomi: "たべる"}
    @godan_verb_attrs   %{kumi: "godan", midashi: "話す", yomi: "はなす"}
    # @update_attrs %{kumi: "some updated kumi", midashi: "some updated midashi", yomi: "some updated yomi"}
    # @invalid_attrs %{kumi: nil, midashi: nil, yomi: nil}

    def verb_fixture(attrs \\ %{}) do
      {:ok, verb} =
        attrs
        # |> Enum.into(@valid_attrs)
        |> API.create_verb()

      verb
    end

    test "polite_present/0 returns a correct transformation" do
      ichidan_verb = verb_fixture(@ichidan_verb_attrs)
      godan_verb = verb_fixture(@godan_verb_attrs)

      assert Verb.polite_present(ichidan_verb) == "食べます"
      assert Verb.polite_present(godan_verb) == "話します"
    end

  end
end
