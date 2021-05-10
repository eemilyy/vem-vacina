class Endereco < ApplicationRecord
  belongs_to :usuario

  validates_numericality_of :cep, length: {minimum:7}
  validates :cidade, length: {minimum:3}
  validates :bairro, length: {minimum:3}
  validates :logradouro, length: {minimum:5}

end
