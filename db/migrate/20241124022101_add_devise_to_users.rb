# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[7.1]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      t.string :encrypted_password, null: false, default: "" unless column_exists?(:users, :encrypted_password)

      ## Recoverable
      t.string   :reset_password_token unless column_exists?(:users, :reset_password_token)
      t.datetime :reset_password_sent_at unless column_exists?(:users, :reset_password_sent_at)

      ## Rememberable
      t.datetime :remember_created_at unless column_exists?(:users, :remember_created_at)

      ## Trackable (Uncomment if needed)
      # t.integer  :sign_in_count, default: 0, null: false unless column_exists?(:users, :sign_in_count)
      # t.datetime :current_sign_in_at unless column_exists?(:users, :current_sign_in_at)
      # t.datetime :last_sign_in_at unless column_exists?(:users, :last_sign_in_at)
      # t.string   :current_sign_in_ip unless column_exists?(:users, :current_sign_in_ip)
      # t.string   :last_sign_in_ip unless column_exists?(:users, :last_sign_in_ip)

      ## Confirmable (Uncomment if needed)
      # t.string   :confirmation_token unless column_exists?(:users, :confirmation_token)
      # t.datetime :confirmed_at unless column_exists?(:users, :confirmed_at)
      # t.datetime :confirmation_sent_at unless column_exists?(:users, :confirmation_sent_at)
      # t.string   :unconfirmed_email unless column_exists?(:users, :unconfirmed_email)

      ## Lockable (Uncomment if needed)
      # t.integer  :failed_attempts, default: 0, null: false unless column_exists?(:users, :failed_attempts)
      # t.string   :unlock_token unless column_exists?(:users, :unlock_token)
      # t.datetime :locked_at unless column_exists?(:users, :locked_at)

      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps null: false
    end

    add_index :users, :reset_password_token, unique: true unless index_exists?(:users, :reset_password_token)
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
