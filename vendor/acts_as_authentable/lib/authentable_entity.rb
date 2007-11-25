require 'bcrypt'
module AuthentableEntity
  include BCrypt

  def self.included(authentable)
    authentable.class_eval do

      # Virtual attribute for the unencrypted password.
      attr_accessor :password

      validates_presence_of   :login
      validates_length_of     :login, :within => 3..40
      validates_uniqueness_of :login, :case_sensitive => false

      with_options :if => :password_required? do |new_password|
        new_password.validates_presence_of     :password
        new_password.validates_presence_of     :password_confirmation
        new_password.validates_length_of       :password, :within => 6..40
        new_password.validates_confirmation_of :password
      end

      before_save :encrypt_password
      
      # Prevents users from submitting crafted forms that bypasses activation.
      attr_accessible :login, :password, :password_confirmation

      extend ClassMethods
    end
  end

  module ClassMethods

    # Authenticates a user by their login name and unencrypted password.
    # Returns the user or nil.
    def authenticate(login, cleartext)
      u = find_by_login(login)
      u && u.authenticated?(cleartext) ? u : nil
    end
  end

  def authenticated?(cleartext)
    Password.new(crypted_password) == cleartext
  end

  def remember_token?
    remember_token_expires_at && Time.now.utc < remember_token_expires_at 
  end

  # These create and unset the fields required for remembering users
  # between browser closes.
  def remember_me
    remember_me_for 2.weeks
  end

  def remember_me_for(time)
    remember_me_until time.from_now.utc
  end

  def remember_me_until(time)
    require 'digest/sha1'
    self.remember_token_expires_at = time
    self.remember_token = Digest::SHA1.hexdigest("#{login}--#{remember_token_expires_at}")
    save(false)
  end

  def forget_me
    self.remember_token_expires_at = nil
    self.remember_token = nil
    save(false)
  end

  protected
    def encrypt_password
      return if password.blank?
      self.crypted_password = Password.create(password)
    end
    
    def password_required?
      crypted_password.blank? || !password.blank?
    end
end
