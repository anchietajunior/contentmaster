class Post < ApplicationRecord
  # Relacionamentos entre models
  belongs_to :user
  has_one :ai_review
  # Representação da tabela posts
  # Validação
  validates :title, presence: true
  validates :content, presence: true

  # Callback
  after_commit :generate_ai_review

  private

  def generate_ai_review
    chat = RubyLLM.chat
    response = chat.ask("Dê uma dica para publicação de um post na rede
                        social #{self.social_network} sobre o assunto: #{self.title}
                       , aqui estão algumas informações adicionais: #{self.content}
          A responsta deve ser apenas texto, sem interações e sem formatação").content

    AiReview.create(post: self, content: response)
  end
end
