class Worker < ApplicationRecord
    validates :name,
            :presence => true,
            length: { :minimum => 2 },
            format: {
                :with => /\A[(\s)a-zA-Z]+\z/,
                :message => "deve conter apenas letras"
            }
    
    validates :cpf,
            :presence => true,
            uniqueness: true,
            format: {
                :with => /\A\d{3}\.\d{3}\.\d{3}-\d{2}\z/,
                :message => "deve estar no formato XXX.XXX.XXX-XX"
            }
    
    validates :birthdate, :presence => true
    
    validates :salary, :presence => true, numericality: { :greater_than_or_equal_to => 0 }
    
    validates :street, :presence => true, length: { :minimum => 5 }
    
    validates :number,
            :presence => true,
            length: { :minimum => 2 },
            format: {
                :with => /\A\d+[a-z]*\z/,
                :message => "número inválido" 
            }
    
    validates :district, :presence => true, length: { :minimum => 2 }
    
    validates :city, :presence => true, length: { :minimum => 2 }
    
    validates :state, :presence => true, length: { :minimum => 2 }
    
    validates :zip_code,
            :presence => true,
            format: {
                :with => /\A\d{5}\-\d{3}\z/,
                :message => "deve estar no formato XXXXX-XXX"
            }
    
    validates :personal_phone,
            :presence => true,
            format: {
                :with => /\A\(\d{2}\)\d{5}\-\d{4}\z/,
                :message => "deve estar no formato (XX)XXXXX-XXXX"
            }
    
    validates :reference_phone,
            :presence => true,
            format: {
                :with => /\A\(\d{2}\)\d{5}\-\d{4}\z/,
                :message => "deve estar no formato (XX)XXXXX-XXXX"
            }
end
