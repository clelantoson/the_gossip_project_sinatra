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
    CSV.open("db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read('db/gossip.csv').each do |line|
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

end