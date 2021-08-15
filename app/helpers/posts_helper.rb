module PostsHelper
    def choose_new_or_edit
        if action_name == 'index' || action_name == 'create'
          confirm_posts_path
        elsif action_name == 'edit'
          post_path
        end
    end

    def get_current_user_post
      @posts = Post.where(user_id: current_user.id).order(updated_at: :desc)
    end
end
