class User < ApplicationRecord
  validates_uniqueness_of :username

  def self.generate
    username = generate_unique_username
    create(username: username)
  end

  private

  def self.generate_unique_username
    adjectives = ['Ancient', 'Creative', 'Dangerous', 'Effective', 'Flying', 'Gilded']
    nouns = ['Highway', 'Intern', 'Jackhammer', 'Lion', 'Master']
    
    loop do
      number = rand.to_s[2..4]
      username = "#{adjectives.sample}-#{nouns.sample}-#{number}"
      break username unless User.exists?(username: username)
    end
  end
end
