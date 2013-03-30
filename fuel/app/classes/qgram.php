<?php

class Qgram {

	static public function generate($table, $id)
	{
		Qgram::clear($table, $id);

		$sql = 'INSERT INTO `'.$table.'_qgram` (`id`, `position`, `qgram`)';
		$lines = 0;

		foreach (Qgram::get_id_and_name($table, $id) as $data)
		{
			$id = $data['id'];
			$name = '##'.trim($data['name']).'$$';
			$lines++;
			for ($i = 0; $i < mb_strlen($name) - 2; $i++)
			{
				$qgram = mb_substr($name, $i, 3);
				DB::query($sql.' VALUES('.$id.', '.($i + 1).', '.DB::quote($qgram).')')->execute();
			}
		}
		echo $lines.' lines inserted';
	}

	static public function clear($table, $id)
	{
		$del = DB::delete($table.'_qgram');
		if ($id != '*')
		{
			$del = $del->where('id', $id);
		}
		$del->execute();
	}

	static private function get_id_and_name($table, $id)
	{
		$sel = DB::select('id', 'name')->from($table);
		if ($id != '*')
		{
			$sel = $sel->where('id', $id);
		}
		return $sel->execute();
	}

}