class User < ApplicationRecord
    has_many :check_ins, dependent: :destroy
    has_many :check_outs, dependent: :destroy
    has_many :breaks, dependent: :destroy
end
