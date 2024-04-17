class FixColumnName < ActiveRecord::Migration[7.1]
  def change
    #Primer archivo
    create_table :clientes do |t|
      t.text :nombre
      t.text :apellido_paterno
      t.text :apellido_materno
      t.text :correo
      t.text :telefono
      t.text :calle
      t.text :colonia
      t.text :codigo_postal
      t.text :ciudad
      t.text :pais

      t.timestamps
    en
    #Segunda archivo
    create_table :usuarios do |t|
      ## Database authenticatable
      t.text :email,              null: false, default: ""
      t.text :encrypted_password, null: false, default: ""

      ## Recoverable
      t.text   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.text   :current_sign_in_ip
      # t.text   :last_sign_in_ip

      ## Confirmable
      # t.text   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.text   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.text   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :usuarios, :email,                unique: true
    add_index :usuarios, :reset_password_token, unique: true
    # add_index :usuarios, :confirmation_token,   unique: true
    # add_index :usuarios, :unlock_token,         unique: true
  end
  #Tercer archivo
  create_table :pedidos do |t|
    t.integer :cantidad_ordenada
    t.datetime :fecha_inicial
    t.datetime :fecha_entrega

    t.timestamps
  end
  #Cuarto archvio
  add_column :pedidos, :pedido_id, :integer
  add_index :pedidos, :pedido_id

    #Ultimo archivo
    rename_column :pedidos, :pedido_id, :usuario_id
    # Renombrar el índice también
    rename_index :pedidos, 'index_pedidos_on_pedido_id', 'index_pedidos_on_usuario_id' 
  end
end
