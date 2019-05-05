<?php

class User {
    public function __construct($slim) {
        $this->db = $slim->db;
    }

    public function getAllData() {
            $stmt = $this->db->query("SELECT * FROM roles");
            $roles = $stmt->fetchAll();
            return $roles;
    }
}