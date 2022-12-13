require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    birth_date: Field::DateTime.with_options(
      format: "%d/%m/%Y"),
    center: Field::BelongsTo,
    courses: Field::HasMany,
    email: Field::String,
    encrypted_password: Field::String,
    first_name: Field::String,
    is_admin: Field::Boolean,
    last_name: Field::String,
    order_courses: Field::HasMany,
    order_subscriptions: Field::HasMany,
    remember_created_at: Field::DateTime,
    reset_password_sent_at: Field::DateTime,
    reset_password_token: Field::String,
    subscriptions: Field::HasMany,
    created_at: Field::DateTime.with_options(
      format: "%d/%m/%Y"),
    updated_at: Field::DateTime.with_options(
      format: "%d/%m/%Y"),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    first_name
    last_name
    center
    subscriptions
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    first_name
    last_name
    email
    birth_date
    center
    is_admin
    order_subscriptions
    order_courses
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    first_name
    last_name
    email
    birth_date
    center
    is_admin
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(user)
    "#{user.first_name} #{user.last_name}"
  end
end