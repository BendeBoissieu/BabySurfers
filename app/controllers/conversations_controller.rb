class ConversationsController < ApplicationController

  def show
    @conversation = Conversation.includes(messages: {  }).find(params[:id])
    @conversation.update(last_opened_id: current_user.id)
  end

 def index
    # @conversation = Conversation.includes(messages: :user).find(params[:id])
    # conversations = policy_scope(Conversation)
    @user = current_user
    query = <<-SQL
      SELECT * FROM matches
      JOIN conversations ON matches.id = conversations.match_id
      WHERE (
      user_one_id = :current_user_id AND mutual = TRUE
      OR
      user_two_id = :current_user_id AND mutual = TRUE
      )
      SQL
      conversations = Conversation.find_by_sql([ query, { current_user_id: current_user.id }] )

   if conversations == []
     redirect_to profiles_path, alert: 'You have to match with someone to start a conversation!'
    else
      @started = []
      @unstarted = []
      conversations.delete(nil)
      conversations.each do |convo|
          if convo.messages == []
            @unstarted << convo
          else
            @started << convo
          end
      end
    end
  end

  def conversation_params
    params.require(:conversation).permit(:last_opened_id)
  end
end
