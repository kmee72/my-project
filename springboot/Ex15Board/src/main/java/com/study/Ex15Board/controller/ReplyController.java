package com.study.Ex15Board.controller;

import com.study.Ex15Board.dto.ReplySaveRequestDto;
import com.study.Ex15Board.service.ReplyService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/reply")
@RequiredArgsConstructor
public class ReplyController {
    private  final ReplyService replyService;

    @GetMapping("/deleteAction")
    @ResponseBody
    public String deleteAction(@RequestParam Long replyIdx,
                               @RequestParam Long boardIdx){
        replyService.delete(replyIdx);
        return "<script>alert('댓글삭제 성공!');  location.href='/board/contentForm?boardIdx=" + boardIdx + " ';</script>";
    }

    @PostMapping("/writeReplyAction")
    @ResponseBody
    public String writeReplyAction(@ModelAttribute ReplySaveRequestDto dto,
                                   @RequestParam Long replyBoardIdx){
        Long newReplyIdx=replyService.save(dto);

        boolean isFound=replyService.existsById(newReplyIdx);
        if(isFound){
            return "<script>alert('댓글쓰기 성공!'); location.href='/board/contentForm?boardIdx=" + replyBoardIdx + " ';</script>";
        }else {
            return "<script>alert('댓글쓰기 실패!');  history.back();script>";
        }
    }



    @PostMapping("/updateReplyAction")
    @ResponseBody
    public String updateReplyAction(@RequestParam Long replyIdx,
                                    @RequestParam Long boardIdx,
                                    @RequestParam String replyContent) {
        try {
            replyService.update(replyIdx, replyContent);
            return "<script>alert('댓글이 수정되었습니다.'); location.href='/board/contentForm?boardIdx=" + boardIdx + "';</script>";
        } catch (Exception e) {
            return "<script>alert('수정 실패!'); history.back();</script>";
        }
    }
}//class
