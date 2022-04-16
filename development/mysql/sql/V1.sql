-- index
ALTER TABLE session ADD INDEX value_idx (value);

ALTER TABLE group_member ADD INDEX group_idx (group_id);
ALTER TABLE group_member ADD INDEX user_idx (user_id);

ALTER TABLE record ADD INDEX status_idx (status);
ALTER TABLE record_comment ADD INDEX linked_rec_idx (linked_record_id);
ALTER TABLE record_item_file ADD INDEX linked_rec_idx (linked_record_id);

ALTER TABLE record ADD INDEX upd_rec_idx (updated_at DESC, record_id ASC);
ALTER TABLE record ADD INDEX cre_st_idx (created_by, status);

-- default
--ALTER TABLE record MODIFY created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
--ALTER TABLE record MODIFY updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
--ALTER TABLE record MODIFY status VARCHAR(16) DEFAULT 'open';

--ALTER TABLE record_item_file MODIFY created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
