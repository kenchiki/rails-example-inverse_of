# reject_ifとinverse_ofを試す

## ポイント
- reject_if: :all_blankでArticleのtitleとdescriptionのどちらも入力されていなければarticleがなかったことになるので、バリデーションが走らない

### 条件が重なるとinverse_ofが必要になる

- `has_many :articles, -> { order(id: :desc) }`のように`-> { 〜 }`なった場合、`inverse_of: :blog`がなければ下記のバリデーションでblog.titleを参照することができなかった

```ruby
# article.rb
validate ->(article) {
    if article.blog.title.include?('blog') && article.title.include?('blog')
      errors.add(:title, 'blogのタイトルにblogという文字が入っていたらarticleのタイトルにblogが
入っていてはいけない')
    end
  }
```

- `belongs_to :blog`にも`inverse_of: :articles`を指定しないと`blog.rb`で、カスタムバリデーションを作り、その中で`articles`を参照できないのかもしれない（要検証）

## 動かし方
- `db:seed`
