
    require("pry-byebug")
    require_relative("./models/bounty.rb")

      Bounty.delete_all()

      villian1 = Bounty.new({
        "name" => "ZARDOZ",
        "species" => "Blouble Xorp",
        "value" => 4000,
        "danger_level" => "medium",
        "fav_weapon" => "blaster",
        "cashed_in" => "Y",
        "collected_by" => "Killa B"
        })
        villian1.save()

        villian2 = Bounty.new({
          "name" => "PFGH' HUFG-!*^LK",
          "species" => "Giant Slug",
          "value" => "6000",
          "danger_level" => "low",
          "fav_weapon" => "slime",
          "cashed_in" => "Y",
          "collected_by" => "Bill the Gardener"
          })
          villian2.save()

          villian3 = Bounty.new({
            "name" => "Jeff",
            "species" => "Human",
            "value" => "10000",
            "danger_level" => "ermagerdyerderd!",
            "fav_weapon" => "his dry wit",
            "cashed_in" => "N",
            "collected_by" => "HunterBot5000"
            })
            villian3.save()

        binding.pry
        nil
