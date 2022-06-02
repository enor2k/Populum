class Question < ApplicationRecord
  belongs_to :survey
  has_many :options, dependent: :destroy

  accepts_nested_attributes_for :options, allow_destroy: true

  enum answer_type: { single_choice: "singlechoice", multiple_choice: "multiplechoice", long_answer: "long" }

  def self.answer_type_select
    answer_types.keys.map { |k| [k.titleize, k] }
  end
end
