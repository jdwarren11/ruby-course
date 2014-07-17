require 'active_record'
require 'pry-byebug'

module DoubleDog
  module Database
    class SQL

      class Item < ActiveRecord::Base
        has_many :order_items
        has_many :orders, through: :order_items
      end

      class Order < ActiveRecord::Base
        belongs_to :user
        has_many :order_items
        has_many :items, through: :order_items
      end

      class User < ActiveRecord::Base
        has_many :orders
        has_many :sessions
      end

      class OrdersItem < ActiveRecord::Base
        # has_many :orders
        # has_many :items
        belongs_to :order
        belongs_to :item
      end

      class Session < ActiveRecord::Base
        belongs_to :user
      end

      def clear_everything
        Item.delete_all
        User.delete_all
        Order.delete_all
      end

      def create_user(attrs) # takes a hash of data and returns new user with id
        ar_user = User.create(attrs)
        DoubleDog::User.new(ar_user.id, ar_user.username, ar_user.password, ar_user.admin)
      end

      def get_user(id)
        ar_user = User.find(id)
        DoubleDog::User.new(ar_user.id, ar_user.username, ar_user.password, ar_user.admin)
      end

      def create_session(attrs)
        ar_session = Session.create(attrs)
      end

      def get_user_by_session_id(sid)
        ar_session = Session.find(sid)
        ar_user = User.find(ar_session.user_id)
        DoubleDog::User.new(ar_user.id, ar_user.username, ar_user.password)
      end

      def get_user_by_username(username)
        ar_user = User.find_by(username: username)
        DoubleDog::User.new(ar_user.id, ar_user.username, ar_user.password, ar_user.admin)
      end

      def create_item(attrs)
        ar_item = Item.create(attrs)
        DoubleDog::Item.new(ar_item.id, ar_item.name, ar_item.price)
      end

      def get_item(id)
        ar_item = Item.find(id)
        DoubleDog::Item.new(ar_item.id, ar_item.name, ar_item.price)
      end

      def all_items
        ar_items = Item.all
        ar_items.map do |attrs|
          DoubleDog::Item.new(attrs['id'], attrs['name'], attrs['price'])
        end
      end

      def create_order(attrs)
        ar_order = Order.create(user_id: attrs[:employee_id])
        ar_items = []
        attrs[:items].each do |item|
          ar_items.push(item)
        end
        DoubleDog::Order.new(ar_order.id, attrs[:employee_id], ar_items)
        # ar_order_item = OrderItem.create(order_id: ar_order.id, item_id: item.id)
      end

      def get_order(id)
        ar_order = Order.find(id)
        DoubleDog::Order.new(ar_order.id, ar_order.employee_id, ar_order.items)
      end

      def all_orders
        ar_orders = Order.all
        ar_orders.map do |attrs|
          DoubleDog::Order.new()
        end
      end



    end
  end
end