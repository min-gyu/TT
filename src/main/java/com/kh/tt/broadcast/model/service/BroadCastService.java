package com.kh.tt.broadcast.model.service;

import java.util.ArrayList;

import com.kh.tt.broadcast.model.vo.BanWord;

public interface BroadCastService{

	ArrayList<BanWord> searchBanWord(String owner);

	int selectChannelNum(String owner);

	int insertBanWord(BanWord addBanWord);

}
