class Driver < ApplicationRecord
    has_many :trips

    validates :name, :cpf, :cnh, :phone, presence: true
end
