class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: ["Fiction", "Non-Fiction"]
  validate :non_clickbait

  private

  def non_clickbait
    clickbait_patterns = [
      /Won't Believe/i,
      /Secret/i,
      /Top \d+/i,
      /Guess/i
    ]

    unless clickbait_patterns.any? { |pattern| pattern.match?(title) }
      errors.add(:title, "must be clickbait-y")
    end
  end
end
