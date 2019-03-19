# frozen_string_literal: true

RailsAdmin.config do |config|
  ### Popular gems integration
  config.authorize_with do
    redirect_to main_app.root_path unless current_user&.admin
  end
  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.model Article do
    edit do
      field :title
      field :article_text, :ck_editor
      field :short_description
      field :title_image
      field :all_tags
      field :publish_date
      field :is_published
      field :author
      field :author_link
      field :article_source
      field :article_source_link
      field :slug do
        help 'НЕ ТРОГАТЬ! Менять только в случае орфографической ошибки в url'
      end
    end
    list do
      field :title
      field :article_text, :ck_editor
      field :short_description
      field :title_image
      field :all_tags
      field :publish_date
      field :created_at
      field :updated_at
    end
  end

  config.model News do
    edit do
      field :title
      field :news_text, :ck_editor
      field :short_description
      field :title_image
      field :all_tags
      field :publish_date
      field :is_published
      field :author
      field :author_link
      field :news_source
      field :news_source_link
      field :slug do
        help 'НЕ ТРОГАТЬ! Менять только в случае орфографической ошибки в url'
      end
    end
    list do
      field :title
      field :news_text, :ck_editor
      field :short_description
      field :title_image
      field :all_tags
      field :publish_date
      field :created_at
      field :updated_at
    end
  end

  config.model Gallery do
    edit do
      field :title
      field :description_img
      field :image
      field :publish_date
    end
  end

  config.model TierList do
    edit do
      field :name
      field :eng_name
      field :description, :ck_editor
      field :slug
    end
  end

  config.model Deck do
    edit do
      field :name
      field :description, :ck_editor
      field :short_description
      field :user
      field :is_published
      field :published_at
      field :green_color
      field :red_color
      field :black_color
      field :blue_color
      field :cards_count
      field :deck_code
      field :slug
    end
  end

  config.model Card do
    edit do
      field :title
      field :eng_title
      field :description do
        label 'Описание'
        help '<span>Активная <span class="icon-cd"></span> 1: </span>'
      end
      field :card_class, :enum do
        label 'Тип карты'
        enum do
          [
            ['Герой', 1],
            ['Заклианние', 2],
            ['Предмет', 3],
            ['Крип', 4],
            ['Улучшение', 5]
          ]
        end
      end
      field :item_type, :enum do
        label 'Тип предмета'
        enum do
          [
            ['Одежда', 1],
            ['Броня', 2],
            ['Оружие', 3],
            ['Расходник', 4]
          ]
        end
      end
      field :color, :enum do
        label 'Цвет'
        enum do
          [
            ['Зеленый', 1],
            ['Красный', 2],
            ['Черный', 3],
            ['Синий', 4]
          ]
        end
      end
      field :rarity, :enum do
        label 'Редкость'
        enum do
          [
            ['Базовая', 1],
            ['Обычная', 2],
            ['Необычная', 3],
            ['Редкая', 4]
          ]
        end
      end
      field :card_set, :enum do
        label 'Сет'
        enum do
          [
            ['base', 1],
            ['call to arms', 2]
          ]
        end
      end
      field :manacost
      field :image_card do
        label 'Главная картинка карты'
      end
      field :hero_icon do
        label 'Иконка героя, та, что рядом с именем'
      end
      field :hero_spells do
        label 'Способность героя или крипа'
      end
      field :second_hero_spells do
        label 'Вторая способность героя или крипа'
        help 'На данный момент только у Meepo'
      end
      field :second_hero_ability_type, :enum do
        label 'Тип второй абилки героя'
        enum do
          [
            ['Continuous effect', 1],
            ['Reactive Ability', 2],
            ['Passive Ability', 3],
            ['Active Ability', 4]
          ]
        end
      end
      field :second_hero_ability_title do
        label 'Название второй способности'
        help 'На данный момент только у Meepo'
      end
      field :second_hero_ability_description do
        label 'Описание второй способности'
        help 'На данный момент только у Meepo'
      end
      field :impr_ability do
        label 'Пассивная способность улучшения'
      end
      field :hero_parent_id, :enum do
        label 'Герой владелец'
        help 'Заполнять только если эта сигнатурная карта героя'
        enum do
          Card.order(:title).where(card_class: 1).map { |hero| [hero.title, hero.id] }
        end
      end
      field :item_gold do
        label 'Золото'
        help 'Только для предметов'
      end
      field :attack do
        label 'Атака'
      end
      field :armor do
        label 'Броня'
      end
      field :health do
        label 'Здоровье'
      end
      field :ability_type, :enum do
        label 'Тип абилки героя или крипа'
        enum do
          [
            ['Continuous effect', 1],
            ['Reactive Ability', 2],
            ['Passive Ability', 3],
            ['Active Ability', 4]
          ]
        end
      end
      field :ability_name do
        label 'Название скила героя или крипа'
      end
      field :ability_description do
        label 'Описание скила героя или крипа'
      end
      field :lore_text do
        label 'Лор карты'
      end
      field :any_lane do
        label 'Можно ставить на любую линию?'
      end
      field :steam_market_id do
        label 'id страницы в магазине'
      end
      field :steam_item_nameid do
        label 'item_nameid в JSON стима'
      end
      field :market_price do
        label 'Цена на Steam площадке'
      end
      field :slug do
        label 'url'
        help 'создается автоматически'
      end
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    export
    bulk_delete
    show
    show_in_app
    new do
      only [Article,
            News,
            Gallery,
            Card,
            Comment,
            TierList,
            TierListGroup,
            TierListCard,
            Deck,
            DeckCard,
            Ckeditor::Picture,
            Ckeditor::Asset,
            Ckeditor::AttachmentFile]
    end
    edit do
      only [Article,
            News,
            Gallery,
            Card,
            Comment,
            TierList,
            TierListGroup,
            TierListCard,
            Deck,
            DeckCard,
            Ckeditor::Picture,
            Ckeditor::Asset,
            Ckeditor::AttachmentFile]
    end
    delete do
      only [Article,
            News,
            Gallery,
            Card,
            Comment,
            TierList,
            TierListGroup,
            TierListCard,
            Deck,
            DeckCard,
            Ckeditor::Picture,
            Ckeditor::Asset,
            Ckeditor::AttachmentFile]
    end
    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
