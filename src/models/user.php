<?php

class User {

    private $dbb;
    private $error;

    public function __construct($slim) {
        $this->db = $slim->container['db'];
    }

    public function getConn() {
        return $this->conn;
    }

    public function getError() {
        return $this->error;
    }

    public function setError($error) {
        $this->error = $error;
    }

    public static function getbyId($db, $id) {
        try {
            $stmt = $db->prepare("SELECT u.id, u.name, u.email, u.password, u.date_registered, r.name as role
                               FROM table_user u, table_role r
                               WHERE u.role_id = r.id
                               AND u.id = :id");
            $stmt->execute(['id' => $id]);
            while ($row = $stmt->fetch()) {
                $user->fill($row);
            }
            return $user;
        } catch (Exception $e) {
            echo $e->getMessage();
        }

    }
}