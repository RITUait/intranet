class User
  include Mongoid::Document
  include Mongoid::Document::Roleable
  embeds_one :profile
  accepts_nested_attributes_for :profile
  embeds_many :leave_details
  accepts_nested_attributes_for :leave_details

  ROLES = ['Admin', 'HR', 'Manager', 'Employee']
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password , :default => ""

  validates_presence_of :email
  validates_presence_of :encrypted_password
  
  attr_accessible :email, :password, :password_confirmation, :roles
  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip 
  field :last_sign_in_ip,    :type => String


  ## Confirmable
  field :confirmation_token,   :type => String
  field :confirmed_at,         :type => Time
  field :confirmation_sent_at, :type => Time
  field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Invitable
  field :invitation_token
  field :invitation_sent_at, type: Time
  field :invitation_accepted_at, type: Time
  field :invitation_limit, type: Integer
  field :invited_by_id, type: Integer
  field :invited_by_type
  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token 

    belongs_to :organization
  has_many :leaves, class_name: "Leave"
end