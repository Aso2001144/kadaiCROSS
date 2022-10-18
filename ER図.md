```uml
@startuml
skinparam class {
    '図の背景
    BackgroundColor Snow
    '図の枠
    BorderColor Black
    'リレーションの色
    ArrowColor Black
}
!define MASTER_MARK_COLOR Orange 
!define TRANSACTION_MARK_COLOR DeepSkyBlue
package "課題クロス" as target_system {
    /'
      マスターテーブルを M、トランザクションを T などで表記
      １文字なら "主" とか "従" など日本語でも記載可能
     '/
    entity "ユーザーマスタ" as user <m_users> <<M,MASTER_MARK_COLOR>> {
        + user_id [PK]
        --
        user_name
        grade
        mail
        pass
        good
        bad
        point
        report
        created_at
        updated_at
        deleted_at
    }
    
    entity "掲示板" as board <board> <<T,TRANSACTION_MARK_COLOR>> {
        + board_id [PK]
        --
        # user_id [FK]
        # task_id [FK]
        post_date
        deleted_at
    }
    
    entity "課題テーブル" as task <task> <<T,TRANSACTION_MARK_COLOR>> {
        + task_id[PK]
        --
        # user_id [FK]
        ask_task
        give_task
        comment
        deadline
        created_at
        updated_at
        deleted_at
    }
    
    entity "メッセージマスタ" as msgs <m_msgs> <<M,MASTER_MARK_COLOR>> {
        + msg_id [PK]
        --
        # room_id [FK]
        # user_id [FK]
        msg
        file_url
        send_time
        deleted_at
    }
    
    entity "部屋テーブル" as room <room> <<T,TRANSACTION_MARK_COLOR>> {
        + room_id [PK]
    }
    
    entity "メンバー" as member <member> <<T,TRANSACTION_MARK_COLOR>> {
        # room_id [FK]
        # user_id [FK]
    }
  }
  
user       |o-ri-o{     board
@enduml
```
