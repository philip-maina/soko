module Seeder
  def self.seed_brands
    [
      "Africafe",
      "Barnes & Noble",
      "Betty Crocker",
      "Bidco",
      "Bio",
      "Bitez",
      "Cadbury",
      "Chupa Chups",
      "Cribaz",
      "Hunter's Gourmet",
      "Kellogg's",
      "Kenylon",
      "Kit Kat",
      "Krackles",
      "Mars",
      "Maryland",
      "Mcmillan Publishers",
      "Nestle",
      "Nice & Soft",
      "Nice & Lovely",
      "Nuteez",
      "NuZiwa",
      "Pampers",
      "Pearl",
      "Pishori",
      "Scotch Bright",
      "Tamu Tamu",
      "Tender Soft",
      "Tropical Heat",
      "Velvex",
      "Zesta",
      "Zucchini Greengrocers"
    ].each do |brand|
      Brand.find_or_create_by(name: brand)
    end
  end
end