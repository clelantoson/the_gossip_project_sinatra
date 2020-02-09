require 'pry'
require 'csv'

class Gossip

  attr_accessor :author
  attr_accessor :content

  def initialize(author, content)
    @author = author
    @content = content
  
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read('./db/gossip.csv').each do |line|
      new_gossip = Gossip.new(line[0], line[1])
      all_gossips << new_gossip
    end
    return all_gossips
  end

  def self.find(id)
    all_gossips = Gossip.all
    gossip = all_gossips[id-1] 
    puts gossip
    return gossip
  end

  # ou juste écrire
  # def self.find(id)
  #   Gossip.all[id-1]
  # end

  def self.update(id, gossip_to_update)
    all_gossips_updated = []
    all_gossips = Gossip.all
    all_gossips.with_index do |gossip, index|
      if index == (id-1)
        all_gossips_updated << self
      else
        all_gossips_updated << all_gossips[index]
      end
    end
  end

#premiere tentative de update
    #   def self.update(id, author, content)
  #   array_to_update = Gossip.all
  #   array_to_update.map do |element|
  #     if element == id
  #      puts ""
  #     end
  #   end
  #   puts array_to_update
  # end 

  # def self.delete(id, author, content)
  #   array_to_update = Gossip.all
  #   array_to_update.map do |element|
  #     if element == id
  #       delete_at_index(id)
  #     end
  #   end
  #   puts array_to_update
  # end 

end