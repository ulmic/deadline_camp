class Member < ActiveRecord::Base
  HOW_HEAR_ABOUT_AS_LIST = I18n.t('members.how_hear_about_as_list')
  SKILL_LEVELS = I18n.t('skill.levels')

  attr_accessible :state,             :email,
                  :first_name,        :middle_name,       :last_name,
                  :patronymic,        :phone,
                  :skype,             :jabber,
                  :icq,               :web,
                  :camp_time,         :camp_life,
                  :camp_fee,          :camp_notebook,
                  :hobby,             :sport,
                  :state_event,       :password,
                  :how_hear_about_as, :twitter,
                  :facebook,          :vkontakte,
                  :city,              :birthday,
                  :school,            :group,
                  :auth_token,        :reason,
                  :question


  include UsefullScopes

  has_secure_password
  has_many :jobs
  has_many :additional_educations
  has_many :achievements
  has_many :langs
  has_many :skill_databases
  has_many :skill_ides
  has_many :skill_operation_systems, :class_name => 'SkillOs'
  has_many :skill_others
  has_many :skill_program_langs
  has_many :others
  has_many :preferences

  validates :password, :presence => { :on => :create }
  validates :phone, :presence => true, :phone => true
  validates :email, :presence => true, :uniqueness => true, :email => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :middle_name, presence: true,
                          length: { maximum: 255 }
  validates :facebook, :slug => true, :allow_blank => true
  validates :twitter, :slug => true, :allow_blank => true
  validates :vkontakte, :slug => true, :allow_blank => true
  validates :city, :presence => true
  validates :birthday, :presence => true,
                       :date => { :after => Date.new(1994, 8, 16), :before => Date.new(1999, 8, 16) }
  validates :reason, presence: true
  validates :question, presence: true

  state_machine :state, :initial => :new do
    state :new
    state :accepted
    state :busted

    event :accept do
      transition :new => :accepted
    end

    event :bust do
      transition [:new, :accepted] => :busted
    end
  end

  scope :active, without_state(:busted)

  def generate_auth_token
    self.auth_token = SecureApp.generate_token
  end

end
