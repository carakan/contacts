module ContactsHelper
  def alphabetic_list
    result = []
    "A".upto("Z") do |letter|
      result << link_to(letter, alphabet_contacts_url(:letter => letter))
    end
    result.join(" | ")
  end
end
