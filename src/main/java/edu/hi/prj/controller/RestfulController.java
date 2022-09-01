package edu.hi.prj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import edu.hi.prj.service.BoardService;
import edu.hi.prj.service.BookingService;
import edu.hi.prj.service.LikesService;
import edu.hi.prj.service.PlaceService;
import edu.hi.prj.service.ReplyService;
import edu.hi.prj.service.RoomService;
import edu.hi.prj.vo.BoardVO;
import edu.hi.prj.vo.ImageVO;
import edu.hi.prj.vo.LikeVO;
import edu.hi.prj.vo.PlaceDetailVO;
import edu.hi.prj.vo.PlaceVO;
import edu.hi.prj.vo.ReplyVO;
import edu.hi.prj.vo.ReviewImgVO;
import edu.hi.prj.vo.RoomImgVO;
import edu.hi.prj.vo.RoomVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j

@RequestMapping("/json")
@RestController
public class RestfulController {

	@Autowired
	private BoardService board_service;

	@Autowired
	private ReplyService reply_service;

	@Autowired
	private RoomService room_service;

	@Autowired
	private PlaceService place_service;

	@Autowired
	private LikesService likes_service;

	@Autowired
	private BookingService booking_service;

	@GetMapping("/boards/{id}")
	public BoardVO getBoard(BoardVO boardVO) {

		return board_service.getBoard(boardVO.getId());
	}

	@GetMapping("/room/{num}")
	public List<RoomVO> getRoom(RoomVO roomVO, PlaceVO placeVO) {

		return room_service.getMyRoom(placeVO.getNum());
	}

	@GetMapping("/roomImg/{num}")
	public List<RoomImgVO> getRoomImg(RoomVO roomVO) {

		return room_service.getRoomImg(roomVO.getNum());
	}

	@GetMapping("/review/{num}")
	public List<BoardVO> getReview(PlaceVO placeVO) {

		return board_service.getReview(placeVO.getNum());
	}

	@GetMapping("/reviewInfo/{num}")
	public PlaceDetailVO reviewInfo(PlaceVO placeVO) {

		return place_service.getPlaceDetail(placeVO.getNum());
	}

	@GetMapping("/reviewImg/{num}")
	public List<ReviewImgVO> reviewImg(PlaceVO placeVO) {

		return board_service.getReviewImgList(placeVO.getNum());
	}

	@GetMapping("/reply/{id}")
	public List<ReplyVO> getReply(BoardVO boardVO) {

		return reply_service.getList(boardVO.getId());

	}
	
	@GetMapping("/getPheedImg/{id}")
	public List<ImageVO> getPheedImg(BoardVO boardVO) {

		return board_service.getPheedImg(boardVO.getId());

	}

	@PutMapping("/{id}")
	public ResponseEntity<String> viewUpdate(BoardVO boardVO) {

		ResponseEntity<String> entity = null;
		try {

			int rn = board_service.updateView(boardVO.getId());

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@PutMapping("/replyWrite")
	public ResponseEntity<String> reply(@RequestBody ReplyVO replyVO) {

		ResponseEntity<String> entity = null;
		try {

			reply_service.write(replyVO);

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@PostMapping("/likecreate")
	public void likecreate(LikeVO likeVO) {
		likes_service.likecreate(likeVO);
	}

	@PostMapping("/likedelete")
	public int likedelete(LikeVO likeVO) {
		return likes_service.likedelete(likeVO);
	}

}
