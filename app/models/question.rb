class Question < ApplicationRecord
  belongs_to :survey
  has_many :options, dependent: :destroy
  has_many :answers

  accepts_nested_attributes_for :options, allow_destroy: true

  enum answer_type: { choix_unique: "singlechoice", choix_multiple: "multiplechoice", question_ouverte: "long" }

  def self.answer_type_select
    answer_types.keys.map { |k| [k.titleize, k] }
  end

  def answer_keys
    self.answers.group(:option_id).count.keys.map{ |a| Option.find(a).title}
  end

  def answer_values
    self.answers.group(:option_id).count.values
  end
end
