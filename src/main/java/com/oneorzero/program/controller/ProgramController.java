package com.oneorzero.program.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.oneorzero.bean.ProgramBean;
import com.oneorzero.bean.StoreBean;
import com.oneorzero.program.service.IProgramService;

@Controller
@SessionAttributes({ "store" })
public class ProgramController {
	@Autowired
	IProgramService service;

	@GetMapping("/program/buyProgramAD")
	public String buyADEmptyForm(Model model) { // 生產購買方案空白表單
		if (model.getAttribute("store") == null) { // 未登入
			StoreBean sb = new StoreBean();
			model.addAttribute("storeBean", sb);
			return "redirect:/login/StoreLogin";
		} else {
			ProgramBean pb = new ProgramBean();
			model.addAttribute("programBean", pb);
			return "program/buyProgramAD";
		}
	}

	@PostMapping("/program/buyProgramAD")
	public String buyAD(@ModelAttribute("programBean") ProgramBean pb, Model model) {
		if (pb.getStartTime() == null) {
			model.addAttribute("DateEmptyError", "請選擇方案開始日期");
			return "program/buyProgramAD";
		} else {
			StoreBean sb = (StoreBean) model.getAttribute("store");
			pb.setStore(sb);
			service.buyProgramAD(pb);
			return "redirect:/indexShop";
		}
	}

	@GetMapping("/program/buyProgramBT")
	public String buyBTEmptyForm(Model model) {
		if (model.getAttribute("store") == null) { // 未登入
			StoreBean sb = new StoreBean();
			model.addAttribute("storeBean", sb);
			return "redirect:/login/StoreLogin";
		} else {
			ProgramBean pb = new ProgramBean();
			model.addAttribute("programBean", pb);
			return "program/buyProgramBT";
		}

	}

	@PostMapping("/program/buyProgramBT")
	public String buyBT(@ModelAttribute("programBean") ProgramBean pb, Model model) {
		if (pb.getStartTime() == null) {
			model.addAttribute("DateEmptyError", "請選擇方案開始日期");
			return "program/buyProgramBT";
		} else {
			StoreBean sb = (StoreBean) model.getAttribute("store");
			pb.setStore(sb);
			service.buyProgramBT(pb);
			return "redirect:/indexShop";
		}
	}

	@GetMapping("/program/buyProgramSM")
	public String buySMEmptyForm(Model model) {
		if (model.getAttribute("store") == null) { // 未登入
			StoreBean sb = new StoreBean();
			model.addAttribute("storeBean", sb);
			return "redirect:/login/StoreLogin";
		} else {
			ProgramBean pb = new ProgramBean();
			model.addAttribute("programBean", pb);
			return "program/buyProgramSM";
		}

	}

	@PostMapping("/program/buyProgramSM")
	public String buySM(@ModelAttribute("programBean") ProgramBean pb, Model model) {
		if (pb.getStartTime() == null) {
			model.addAttribute("DateEmptyError", "請選擇方案開始日期");
			return "program/buyProgramSM";
		} else {
			StoreBean sb = (StoreBean) model.getAttribute("store");
			pb.setStore(sb);
			service.buyProgramSM(pb);
			return "redirect:/indexShop";
		}
	}

	@GetMapping("/program/buyAll")
	public String buyAllEmptyForm(Model model) {
		if (model.getAttribute("store") == null) { // 未登入
			StoreBean sb = new StoreBean();
			model.addAttribute("storeBean", sb);
			return "redirect:/login/StoreLogin";
		} else {
			ProgramBean pb = new ProgramBean();
			model.addAttribute("programBean", pb);
			return "program/buyAll";
		}
	}

	@PostMapping("/program/buyAll")
	public String buyAllProgram(@ModelAttribute("programBean") ProgramBean pbAD, Model model) {
		if (pbAD.getStartTime() == null) {
			model.addAttribute("DateEmptyError", "請選擇方案開始日期");
			return "program/buyAll";
		} else {
			StoreBean sb = (StoreBean) model.getAttribute("store");
			pbAD.setStore(sb);
			ProgramBean pbBT = new ProgramBean();
			ProgramBean pbSM = new ProgramBean();
			pbBT.setName("programBT");
			pbSM.setName("programSM");
			pbBT.setStartTime(pbAD.getStartTime());
			pbSM.setStartTime(pbAD.getStartTime());
			pbBT.setStore(sb);
			pbSM.setStore(sb);
			List<ProgramBean> pbList = new ArrayList<ProgramBean>();
			pbList.add(pbAD);
			pbList.add(pbBT);
			pbList.add(pbSM);
			service.buyAll(pbList);
			return "redirect:/indexShop";
		}
	}
}
