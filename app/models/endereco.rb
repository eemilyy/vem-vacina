class Endereco < ApplicationRecord
  belongs_to :usuario

  validates :cep, presence: true, length: {is: 8}, numericality: { only_integer: true }
  validates :cidade, presence: true, length: {minimum:3}, numericality: false
  validates :bairro, presence: true, length: {minimum:5}
  validates :logradouro, presence: true, length: {minimum:10}
  validates :complemento, presence: true, length: {minimum:5}
end
