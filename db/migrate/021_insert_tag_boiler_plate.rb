class InsertTagBoilerPlate < ActiveRecord::Migration
  def self.up
		Tag.create([
			{:name => 'comic book'},
			{:name => 'super hero'},
			{:name => 'dragon'},
			{:name => 'epic'},
			{:name => 'martial arts'},
			{:name => 'samurai'},
			{:name => 'sea'},
			{:name => 'pirate'},
			{:name => 'swords'},
			{:name => 'dark comedy'},
			{:name => 'heist'},
			{:name => 'mockumentary'},
			{:name => 'slapstick'},
			{:name => 'spoofs'},
			{:name => 'stand Up'},
			{:name => 'mythology'},
			{:name => 'politics'},
			{:name => 'biography'},
			{:name => 'history'},
			{:name => 'documentary'},
			{:name => 'philosophical'},
			{:name => 'travel'},
			{:name => 'addiction drama'},
			{:name => 'coming-of-age'},
			{:name => 'courtroom drama'},
			{:name => 'childhood drama'},
			{:name => 'police'},
			{:name => 'tragedy'},
			{:name => 'gangster'},
			{:name => 'cult film'},
			{:name => 'aliens'},
			{:name => 'monsters'},
			{:name => 'gothic'},
			{:name => 'supernatural'},
			{:name => 'slasher'},
			{:name => 'gore'},
			{:name => 'infant'},
			{:name => 'toddler'},
			{:name => 'ages 4-6'},
			{:name => 'ages 7-10'},
			{:name => 'ages 11-13'},
			{:name => 'cyberpunk'},
			{:name => 'prehistoric'},
			{:name => 'dinosaurs'},
			{:name => 'disaster'},
			{:name => 'anti-war'},
			{:name => 'espinoage'},
			{:name => 'spy movie'},
			{:name => 'modern western'},
			{:name => 'euro western'},
			{:name => 'indian western'}
		])
  end

  def self.down
  end
end