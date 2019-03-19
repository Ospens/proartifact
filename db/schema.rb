# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_12_26_055937) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_ratings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "article_id"
    t.integer "rating"
    t.index ["article_id"], name: "index_article_ratings_on_article_id"
    t.index ["rating"], name: "index_article_ratings_on_rating"
    t.index ["user_id"], name: "index_article_ratings_on_user_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "article_text"
    t.datetime "publish_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title_image_file_name"
    t.string "title_image_content_type"
    t.bigint "title_image_file_size"
    t.datetime "title_image_updated_at"
    t.text "short_description"
    t.string "slug"
    t.string "eng_title"
    t.string "author"
    t.string "author_link"
    t.boolean "is_published", default: true
    t.string "article_source"
    t.string "article_source_link"
    t.index ["is_published"], name: "index_articles_on_is_published"
    t.index ["slug"], name: "index_articles_on_slug"
    t.index ["title"], name: "index_articles_on_title"
  end

  create_table "authorizations", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.bigint "user_id"
    t.string "token"
    t.string "secret"
    t.string "first_name"
    t.string "last_name"
    t.string "name"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider"], name: "index_authorizations_on_provider"
    t.index ["uid"], name: "index_authorizations_on_uid"
    t.index ["user_id"], name: "index_authorizations_on_user_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "card_class"
    t.integer "item_type"
    t.integer "color"
    t.integer "rarity"
    t.integer "manacost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_card_file_name"
    t.string "image_card_content_type"
    t.bigint "image_card_file_size"
    t.datetime "image_card_updated_at"
    t.string "hero_icon_file_name"
    t.string "hero_icon_content_type"
    t.bigint "hero_icon_file_size"
    t.datetime "hero_icon_updated_at"
    t.string "hero_spells_file_name"
    t.string "hero_spells_content_type"
    t.bigint "hero_spells_file_size"
    t.datetime "hero_spells_updated_at"
    t.integer "attack"
    t.integer "armor"
    t.integer "health"
    t.integer "item_gold"
    t.integer "card_set"
    t.integer "hero_parent_id"
    t.string "impr_ability_file_name"
    t.string "impr_ability_content_type"
    t.bigint "impr_ability_file_size"
    t.datetime "impr_ability_updated_at"
    t.string "slug"
    t.text "lore_text"
    t.integer "ability_type"
    t.string "ability_name"
    t.text "ability_description"
    t.string "second_hero_spells_file_name"
    t.string "second_hero_spells_content_type"
    t.bigint "second_hero_spells_file_size"
    t.datetime "second_hero_spells_updated_at"
    t.string "eng_title"
    t.boolean "any_lane"
    t.string "second_hero_ability_title"
    t.text "second_hero_ability_description"
    t.integer "second_hero_ability_type"
    t.integer "steam_market_id"
    t.integer "steam_item_nameid"
    t.float "market_price", default: 0.0
    t.index ["any_lane"], name: "index_cards_on_any_lane"
    t.index ["armor"], name: "index_cards_on_armor"
    t.index ["attack"], name: "index_cards_on_attack"
    t.index ["card_class"], name: "index_cards_on_card_class"
    t.index ["color"], name: "index_cards_on_color"
    t.index ["health"], name: "index_cards_on_health"
    t.index ["item_gold"], name: "index_cards_on_item_gold"
    t.index ["item_type"], name: "index_cards_on_item_type"
    t.index ["manacost"], name: "index_cards_on_manacost"
    t.index ["rarity"], name: "index_cards_on_rarity"
    t.index ["title"], name: "index_cards_on_title"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.integer "parent_id"
    t.text "body"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["parent_id"], name: "index_comments_on_parent_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "deck_cards", force: :cascade do |t|
    t.bigint "card_id"
    t.bigint "deck_id"
    t.integer "hero_order"
    t.integer "card_count"
    t.index ["card_count"], name: "index_deck_cards_on_card_count"
    t.index ["card_id"], name: "index_deck_cards_on_card_id"
    t.index ["deck_id"], name: "index_deck_cards_on_deck_id"
    t.index ["hero_order"], name: "index_deck_cards_on_hero_order"
  end

  create_table "decks", force: :cascade do |t|
    t.string "name"
    t.string "eng_name"
    t.text "description"
    t.bigint "user_id"
    t.datetime "published_at"
    t.boolean "green_color", default: false
    t.boolean "red_color", default: false
    t.boolean "black_color", default: false
    t.boolean "blue_color", default: false
    t.integer "cards_count"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_published", default: false
    t.string "deck_code"
    t.text "short_description"
    t.index ["black_color"], name: "index_decks_on_black_color"
    t.index ["blue_color"], name: "index_decks_on_blue_color"
    t.index ["cards_count"], name: "index_decks_on_cards_count"
    t.index ["green_color"], name: "index_decks_on_green_color"
    t.index ["red_color"], name: "index_decks_on_red_color"
    t.index ["user_id"], name: "index_decks_on_user_id"
  end

  create_table "discussions", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "galleries", force: :cascade do |t|
    t.string "title"
    t.text "description_img"
    t.datetime "publish_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
    t.integer "image_width"
    t.integer "image_height"
  end

  create_table "impressions", force: :cascade do |t|
    t.string "impressionable_type"
    t.integer "impressionable_id"
    t.integer "user_id"
    t.string "controller_name"
    t.string "action_name"
    t.string "view_name"
    t.string "request_hash"
    t.string "ip_address"
    t.string "session_hash"
    t.text "message"
    t.text "referrer"
    t.text "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
    t.index ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index"
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
    t.index ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id"
    t.string "likeable_type"
    t.bigint "likeable_id"
    t.integer "vote", default: 0
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable_type_and_likeable_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
    t.index ["vote"], name: "index_likes_on_vote"
  end

  create_table "news", force: :cascade do |t|
    t.string "title"
    t.string "eng_title"
    t.text "short_description"
    t.text "news_text"
    t.datetime "publish_date"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title_image_file_name"
    t.string "title_image_content_type"
    t.bigint "title_image_file_size"
    t.datetime "title_image_updated_at"
    t.string "author"
    t.string "author_link"
    t.string "news_source"
    t.string "news_source_link"
    t.boolean "is_published", default: true
    t.index ["eng_title"], name: "index_news_on_eng_title"
    t.index ["is_published"], name: "index_news_on_is_published"
    t.index ["publish_date"], name: "index_news_on_publish_date"
    t.index ["slug"], name: "index_news_on_slug"
    t.index ["title"], name: "index_news_on_title"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "article_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "news_id"
    t.index ["article_id"], name: "index_taggings_on_article_id"
    t.index ["news_id"], name: "index_taggings_on_news_id"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name"
  end

  create_table "tier_list_cards", force: :cascade do |t|
    t.bigint "card_id"
    t.bigint "tier_list_group_id"
    t.integer "order"
    t.index ["card_id"], name: "index_tier_list_cards_on_card_id"
    t.index ["order"], name: "index_tier_list_cards_on_order"
    t.index ["tier_list_group_id"], name: "index_tier_list_cards_on_tier_list_group_id"
  end

  create_table "tier_list_groups", force: :cascade do |t|
    t.string "name"
    t.integer "order"
    t.bigint "tier_list_id"
    t.index ["tier_list_id"], name: "index_tier_list_groups_on_tier_list_id"
  end

  create_table "tier_lists", force: :cascade do |t|
    t.string "name"
    t.string "eng_name"
    t.string "slug"
    t.text "description"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "nickname"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "password_generated", default: false
    t.datetime "mute_to"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "article_ratings", "articles"
  add_foreign_key "article_ratings", "users"
  add_foreign_key "authorizations", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "deck_cards", "cards"
  add_foreign_key "deck_cards", "decks"
  add_foreign_key "decks", "users"
  add_foreign_key "likes", "users"
  add_foreign_key "taggings", "articles"
  add_foreign_key "taggings", "tags"
  add_foreign_key "tier_list_cards", "cards"
  add_foreign_key "tier_list_cards", "tier_list_groups"
  add_foreign_key "tier_list_groups", "tier_lists"
end
